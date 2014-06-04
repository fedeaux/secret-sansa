require 'mysql2'

namespace :sync do
  desc "Create files/sync/clients.csv with client data"
  task clients: :environment do
    db = Mysql2::Client.new(:host => '187.45.196.176',
                            :username => 'instrutec2',
                            :password => 'gh6po93',
                            :database => 'instrutec2')

    data = []

    db.query("SELECT * FROM clientes").each { |row|
      data << row
    }

    File.open('files/sync/clients.csv', 'w') { |file| file.write JSON.dump data }
  end

  desc "Create files/sync/locals.csv with local data"
  task locals: :environment do
    db = Mysql2::Client.new(:host => '187.45.196.176',
                            :username => 'instrutec2',
                            :password => 'gh6po93',
                            :database => 'instrutec2')
    data = []
    parent_mapping = {}

    db.query("SELECT * FROM local").each { |row|
      data << row
      parent_mapping[row['id']] = row['local_acima']
    }

    File.open('files/sync/locals.csv', 'w') { |file| file.write JSON.dump data }
    File.open('files/sync/parent_mapping.csv', 'w') { |file| file.write JSON.dump parent_mapping }
  end

  desc "Create files/sync/leads.csv with local data"
  task leads: :environment do
    db = Mysql2::Client.new(:host => '187.45.196.176',
                            :username => 'instrutec2',
                            :password => 'gh6po93',
                            :database => 'instrutec2')
    data = []

    db.query("SELECT * FROM historico").each { |row|
      data << row
    }

    File.open('files/sync/leads.csv', 'w') { |file| file.write JSON.dump data }
  end

  desc "Create files/sync/lead_entries.csv with local data"
  task lead_entries: :environment do
    db = Mysql2::Client.new(:host => '187.45.196.176',
                            :username => 'instrutec2',
                            :password => 'gh6po93',
                            :database => 'instrutec2')
    data = []

    db.query("SELECT * FROM historico_elemento").each { |row|
      data << row
    }

    File.open('files/sync/lead_entries.csv', 'w') { |file| file.write JSON.dump data }
  end
end
