CREATE  TABLE logData_H2 (
  Ltype STRING,
  event_time STRING,
  porder STRING,
  SEVERITY STRING,
  SCLASS STRING,
  PHO STRING ,
  MESG STRING
  
) ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE

LOCATION '/data/logmgmt/_DUMMY/raz-XPS14/150703/';
