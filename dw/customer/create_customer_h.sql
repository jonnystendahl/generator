---------------------------------------------------
--
-- AUTO GENERATED SCRIPT
-- DO NOT EDIT!!
--
-- Table name: customer_h
-- Dataset: dw
--
---------------------------------------------------

CREATE TABLE dw.customer_h (
    column1 STRING OPTION(description='Customer name'),
    column2 INT64 OPTION(description='Customer sales')
    PARTITION BY date
)
CLUSTER BY column1, column2
;