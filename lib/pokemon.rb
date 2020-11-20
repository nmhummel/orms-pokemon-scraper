class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
        # call the execute method on our database(db) 
    end

    def self.find(id, db)
        # find pokemon by their id number
        # return new pokemon object with that info
        pokey = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id: pokey[0], name: pokey[1], type: pokey[2], db: db)
        # db: db --> we used the db in arguments as the value for the key db:
    end


end
