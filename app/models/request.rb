class Request < ApplicationRecord
  enum status: { created: 0, pending: 1, completed: 2, cancelled: 3 }
end
