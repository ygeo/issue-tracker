-- DROP TABLE IF EXISTS weekly_issue ; 

SELECT 'create the "weekly_issue" table'
; 
   CREATE TABLE weekly_issue (
      id             integer NOT NULL PRIMARY KEY
    , level          integer NULL
    , prio           integer NULL
    , status         varchar (50) NOT NULL
    , category       varchar (200) NOT NULL
    , name           varchar (100) NOT NULL
    , description    varchar (4000)
    , start_time     text NULL
    , stop_time      text NULL
    , run_date       date NULL
    );


SELECT 'show the columns of the just created table'
; 

   SELECT attrelid::regclass, attnum, attname
   FROM   pg_attribute
   WHERE  attrelid = 'public.weekly_issue'::regclass
   AND    attnum > 0
   AND    NOT attisdropped
   ORDER  BY attnum
   ; 
