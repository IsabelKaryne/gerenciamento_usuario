class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nome
      t.date :data_de_nascimento
      t.string :email, null: false, unique: true
      t.string :cpf, null: false, unique: true
      t.string :senha_digest
      t.integer :status, default: 0  # 0: Ativo, 1: Inativo
      t.integer :permissao, default: 1  # 0: Admin, 1: Comum

      t.timestamps
    end
  end
end
