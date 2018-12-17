class PurchaseOption < ApplicationRecord
  enum video_quality:  { sd: 'SD', hd: 'HD' }
end
