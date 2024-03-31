---------------------------------------------------
--
-- AUTO GENERATED SCRIPT
-- DO NOT EDIT!!
--
-- Dataset: hadoop_out
-- Table name: customer_h 
--
---------------------------------------------------

CREATE TABLE hadoop_out.customer_h (
    column1 STRING OPTION(description='Customer name'),
    column2 INT64 OPTION(description='Customer sales')
    PARTITION BY date
)
CLUSTER BY column1, column2
;