---------------------------------------------------
--
-- AUTO GENERATED SCRIPT
-- DO NOT EDIT!!
--
-- Table name: customer_h
-- Dataset: hadoop_out
--
---------------------------------------------------

CREATE TABLE hadoop_out.customer_h (
    column1 STRING OPTION(description='Customer name'),
    column2 INT64 OPTION(description='Customer sales')
    PARTITION BY date
)
CLUSTER BY column1, column2
;