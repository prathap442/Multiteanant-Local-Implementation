class User < ApplicationRecord
  after_create :create_the_tenant
  private
  def create_the_tenant
    binding.pry
    Apartment::Tenant.create(subdomain)
  end
end
