require_relative './album'

class AlbumRepository
    def all
        sql = 'SELECT id, title, release_year, artist_id FROM albums;'
        result_set = DatabaseConnection.exec_params(sql, [])

        albums = []

        result_set.each do |record|
            album = Album.new
            album.id = record['id']
            album.title = record['title']
            album.release_year = record['release_year']
            album.artist_id = record['artist_id']

            albums << album
        end

        return albums
    end

    def create(album)
        sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES($1, $2, $3);'
        sql_params = [album.title, album.release_year, album.artist_id]

        DatabaseConnection.exec_params(sql, sql_params)
    end
end