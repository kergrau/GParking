class InvoiceDetail < ApplicationRecord
  def detalle(minutos, inicio, fin, valor)
    return minutos, inicio.to_s, fin.to_s, valor
  end

  def recolectar(elemento, colector)
    colector.each do |col|
      if col.include? elemento[1]
        col[0] += elemento[0] #sumatoria de minutos
        col[3] += elemento[3] #sumatoria de valor
        return
      end
    #p "Entro a metodo."
    end
    colector.push(elemento) if colector.empty? || true
  end

  def segs (inicio, final)
    Time.parse(final.strftime("%H:%M:%S")) -
    Time.parse(inicio.strftime("%H:%M:%S"))
  end

  def to_min(segs)
    segs / 60
  end

  def cobro (minutos, precio)
    minutos * precio
  end

  def consulta(id)
    # Esta es la consulta que me permte traer los precios.
    # Trae los precios por rango horario
    Record.connection.select_all(
      "SELECT prices.valor, prices.hora_inicio, prices.hora_fin
       FROM prices
       WHERE prices.tipo_carro = (
         SELECT railcars.tipo
         FROM railcars INNER JOIN records ON railcars.id = records.railcars_id
         WHERE records.id = #{id}) AND prices.estado = true
         ORDER BY prices.hora_inicio ASC").to_hash
  end

  def en_rango(con, contatiempo)
    if con['hora_inicio'].strftime("%H:%M") <= contatiempo.strftime("%H:%M") &&
      contatiempo.strftime("%H:%M") <= con['hora_fin'].strftime("%H:%M")
      return true
    else
      return false
    end
  end

  def finalizador(con, horafinal, contatiempo)
    if con['hora_inicio'].strftime("%H:%M") <= horafinal.strftime("%H:%M") &&
       horafinal.strftime("%H:%M") <= con['hora_fin'].strftime("%H:%M") &&
       contatiempo.strftime("%Y-%m-%d") == horafinal.strftime("%Y-%m-%d")
       return true
     else
       return false
     end
  end

  def iterador_horario(totalti, contatiempo, sum_precio, items,
     consulta, final)
    consulta.each do |con|
      if en_rango(con, contatiempo)
        if finalizador(con, final, contatiempo)
          p segundos = segs(contatiempo, final)
          cobrar = cobro(to_min(segundos), con['valor'].to_f)
          recolectar(detalle(to_min(segundos), con['hora_inicio'],
          con['hora_fin'], cobrar), items)
          p "restando al tiempo #{totalti -= segundos}"
          return "Valor total #{sum_precio + cobrar}", items
        else
          segundos = segs(contatiempo, con['hora_fin']) + 1
          sum_precio = sum_precio + cobro(to_min(segundos), con['valor'].to_f)
          contatiempo = contatiempo + segundos
          p "restando al tiempo #{totalti -= segundos}"
          recolectar(detalle(to_min(segundos), con['hora_inicio'],
          con['hora_fin'], cobro(to_min(segundos), con['valor'].to_f)),
          items)
        end
      else
        puts "No entro."
      end # Si la hora de inicio esta en el rango
    end # Iterador de la consulta
    if totalti > 0
      iterador_horario(totalti, contatiempo, sum_precio, items,
       consulta, final)
    end
  end

  def detalle_factura(id, items)
    items.each do |item|
      InvoiceDetail.create(invoices_id: id, ind_inicio: item[1],
      ind_fin: item[2], ind_minutos: item[0], ind_valor: item[3])
    end
  end

end
