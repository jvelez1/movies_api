class Purchase < ApplicationRecord
  belongs_to :purchase_option
  enum status:  { pending: 'Pendiente',
                  denaid: 'Rechazado',
                  success: 'Procesado' }
end
