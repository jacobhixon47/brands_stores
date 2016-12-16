class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, :presence => true)
  before_save(:titlecase_name)

private

  define_method(:titlecase_name) do
    self.name=(name().titlecase())
  end
end
