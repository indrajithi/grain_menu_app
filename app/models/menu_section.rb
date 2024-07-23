class MenuSection < ApplicationRecord
  belongs_to :menu
  belongs_to :section

  validates :display_order, presence: true

  after_initialize :set_defaults

  private

  def set_defaults
    self.display_order ||= 0
  end
end
