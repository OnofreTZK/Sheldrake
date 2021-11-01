type t = Transaction.t list

let to_yojson mempool =
  [%to_yojson: Transaction.t list] mempool

let of_yojson json =
  match [%of_yojson: Transaction.t list] json with
    | Ok mempool -> mempool
    | Error err -> err |> fun _ -> raise Parsing.Parse_error 

let add_transaction mempool transaction =
  transaction :: mempool