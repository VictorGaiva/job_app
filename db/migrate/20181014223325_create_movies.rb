class CreateMovies < ActiveRecord::Migration[5.2]
	def change
		create_table :movies do |t|
			t.string :title, null: false
			t.string :external_id, null: false
			t.string :status, null: false
			t.references :profile, index: true, foreign_key: true
			t.timestamps
		end
	end
end
