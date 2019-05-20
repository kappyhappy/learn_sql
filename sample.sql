/* example1 where in */
select *
from products
where product_id
in
(
  select product_id
  from transactiondetails
  where transactiondetails_id
  in
  (
    select transactiondetails_id
    from transactions
    where transaction_id
    in
    (
      select transaction_id
      from transactions
      inner join transactiondetails
      on transactions.transactiondetails_id = transactiondetails.transactiondetails_id
      where transactiondetails.product_id = 3
    )
  )
)
and product_id != 3
;

/* example2 join twice */
select p.product_id, p.product_name
from products p
inner join 
(
select t.transaction_id, td.transactiondetails_id, td.product_id
from transactions t
inner join transactiondetails td
on t.transactiondetails_id = td.transactiondetails_id
where t.transaction_id = 1
) AS tmp
on p.product_id = tmp.product_id
;

