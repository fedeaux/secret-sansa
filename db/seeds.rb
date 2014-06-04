# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if false
  LeadEntry.delete_all
  entries = JSON.parse IO.read 'files/sync/lead_entries.csv'
  entries.each { |entry|
    begin
      LeadEntry.create(:id => entry['id'],
                  :lead_id => entry['historico'],
                  :text => entry['texto'],
                  :relation => entry['rel'],
                  :created_at => entry['escrito_em'],
                  :date => entry['data'])

    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
    end
  }
end

if false
  Lead.delete_all
  leads = JSON.parse IO.read 'files/sync/leads.csv'
  leads.each { |lead|
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

if true
  Client.delete_all

  clients = JSON.parse IO.read 'files/sync/clients.csv'

  clients.each { |client|
    begin
      c = Client.create(:id => client['id'],
                        :name => client['nome'],
                        :observations => client['observacoes'],
                        :title => client['tratamento'],
                        :email => client['email'],
                        :local_id => client['local']
                        )
    rescue
      puts 'sei la'+client['id'].to_s
    end
  }
end
