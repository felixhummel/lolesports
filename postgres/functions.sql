DROP FUNCTION IF EXISTS extract_vodslist();

CREATE FUNCTION extract_vodslist()
    RETURNS void
AS $$
plpy.notice('extract_vodslist called')
URL = 'http://euw.lolesports.com/vods/'
import requests
resp = requests.get(URL)
plan = plpy.prepare("""
    insert into e_vodslist (loaddate, content)
    values ('now', $1)
""", ["text"])
plpy.execute(plan, [resp.content])
$$ LANGUAGE plpythonu;

