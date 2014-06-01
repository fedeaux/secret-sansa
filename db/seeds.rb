# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if true
  Lead.delete_all
  leads = JSON.parse IO.read 'files/sync/leads.csv'
  leads.each { |lead|
    puts lead['assunto']
    begin
      Lead.create(:id => lead['id'],
                  :subject => lead['assunto'],
                  :observations => lead['observacoes'],
                  :last_event_on => lead['ultimo_evento_em'],
                  :status => lead['status'],
                  :has_pendencies => lead['has_pendencies'],
                  :has_file_pendencies => lead['has_file_pendencies'],
                  :disabled => lead['desabilitado'],
                  :is_service => lead['servico'],
                  :created_at => lead['criado_em'],
                  :updated_at => lead['modificado_em']
                  )
    rescue
      puts 'sei la'+lead['id'].to_s
    end
  }
end

if false
  Local.delete_all
  locals = JSON.parse IO.read 'files/sync/locals.csv'
  locals.each { |local|
    begin
      Local.create(:id => local['id'],
                   :name => local['nome'],
                   :category => local['categoria_do_local'],
                   :company_name => local['razao_social'],
                   :address => local['endereco'],
                   :observations => local['observacoes'],
                   :city => local['cidade'],
                   :state => local['estado'],
                   :cep => local['cep'],
                   :cnpj => local['cnpj'])
    rescue
      puts 'sei la'+local['id'].to_s
    end
  }

  mappings = JSON.parse IO.read 'files/sync/parent_mapping.csv'
  mappings.each { |id, parent_id|
    begin
      l = Local.find id
      p = Local.find parent_id
      l.parent = p
      l.save
    rescue
      puts 'oxe '+id.to_s+' '+parent_id.to_s
    end
  }
end

if false
  Client.delete_all
  File.open("files/sync/clients.csv", "r") do |file_handle|
    file_handle.each_line do |client|
      c = client.split('|').map { |w| URI::decode(w) }
      Client.create(:title => c[0], :name => c[1], :email => c[2], :observations => c[3])
    end
  end
end
