json.extract! ticket, :id, :expire_date, :visits_remaining, :cost, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
