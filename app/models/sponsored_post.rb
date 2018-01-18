class SponsoredPost < ApplicationRecord
    belongs_to :topic, dependent: :destroy
end
