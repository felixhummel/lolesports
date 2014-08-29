import sqlalchemy

# ~/.pgpass has credentials
db = sqlalchemy.create_engine('postgresql://localhost')

print db.execute("select 'DB connection success'").scalar()
