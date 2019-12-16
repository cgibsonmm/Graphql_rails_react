class Mutations::EditUser < Mutations::BaseMutation
  argument :name, String,   required: true
  argument :email, String,  required: true
  argument :user_id, Integer,    required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(name:, email:, user_id:)
    @user = User.find(user_id)
    @user.update(name: name, email: email)

    if @user.save
      {
        user: @user,
        errors: []
      }
    else
      {
        users: nil,
        errors: @user.errors.full_messages
      }
    end
  end
end