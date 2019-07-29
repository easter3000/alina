class JwtBlacklist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Blacklist

  self.table_name = 'jwt_blacklist'

  def self.jwt_revoked?(payload, user)
    # TODO inmplement methood
    # Does something to check whether the JWT token is revoked for given user
  end

  def self.revoke_jwt(payload, user)
    # TODO inmplement methood
    # Does something to revoke the JWT token for given user
  end
end
