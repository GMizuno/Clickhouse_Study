select toDate(dt),count(*) 
from series.sample_mergetree sm group by toDate(dt)
order by toDate(dt) asc;


select toDate(dt),count(*),groupUniqArray(id) 
from series.sample_mergetree sm group by toDate(dt)
order by toDate(dt) asc;

