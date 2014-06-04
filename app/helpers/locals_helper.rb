module LocalsHelper
  def state_shortnames()
    ['', 'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'Di', 'ES', 'GO', 'MA', 'Ma', 'MT', 'MS', 'MG', 'PR', 'PB', 'PA', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SE', 'SP', 'TO' ]
  end

  def best_in_place_state_shortnames()
    [['', ''], ['AC', 'AC'], ['AL', 'AL'], ['AP', 'AP'], ['AM', 'AM'], ['BA', 'BA'], ['CE', 'CE'], ['Di', 'Di'], ['ES', 'ES'], ['GO', 'GO'], ['MA', 'MA'], ['Ma', 'Ma'], ['MT', 'MT'], ['MS', 'MS'], ['MG', 'MG'], ['PR', 'PR'], ['PB', 'PB'], ['PA', 'PA'], ['PE', 'PE'], ['PI', 'PI'], ['RJ', 'RJ'], ['RN', 'RN'], ['RS', 'RS'], ['RO', 'RO'], ['RR', 'RR'], ['SC', 'SC'], ['SE', 'SE'], ['SP', 'SP'], ['TO', 'TO']]
  end

  def linked_breadcrumb(local)
    return '' if local.nil?

    links = []
    local.path.each { |local_path_item|
      links.push link_to(local_path_item.name, local_path_item)
    }

    links.join(" > ").html_safe
  end

  def breadcrumb(local)
    breadbrumb = []

    loop do
      breadbrumb.unshift local.name
      local = local.parent
      break if local.nil?
    end

    breadbrumb.join(" > ").html_safe
  end
end
