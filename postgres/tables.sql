DROP TABLE IF EXISTS dumps;

CREATE TABLE dumps (
    id serial,
    loaddate timestamp,
    content text
);

DROP FUNCTION IF EXISTS fetch_dump();

CREATE FUNCTION fetch_dump()
    RETURNS void
AS $$
plpy.notice('fetch_dump called')
URL = 'http://euw.lolesports.com/vods/'
import requests
resp = requests.get(URL)
plan = plpy.prepare("""
    insert into dumps (loaddate, content)
    values ('now', $1)
""", ["text"])
plpy.execute(plan, [resp.content])
$$ LANGUAGE plpythonu;

SELECT fetch_dump();

DROP FUNCTION IF EXISTS get_latest_dump();
CREATE FUNCTION get_latest_dump()
    RETURNS text
AS $$
BEGIN
RETURN (select content from dumps order by loaddate desc limit 1);
END
$$ LANGUAGE plpgsql;

SELECT get_latest_dump();

-- SELECT * from vodslists;


