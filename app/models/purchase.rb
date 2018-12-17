class Purchase < ApplicationRecord
  enum status:  { pending: 'Pendiente',
                  denaid: 'Rechazado',
                  success: 'Procesado' }
end
