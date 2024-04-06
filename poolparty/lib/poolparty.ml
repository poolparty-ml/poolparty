open Riot
module Messages = Messages

open Logger.Make (struct
  let namespace = ["poolparty"]
end)

let start_link ~pool_size =
  let child_specs = [Manager.child_spec ~pool_size ()] in

  match Supervisor.start_link ~restart_limit:10 ~child_specs () with
  | Ok s -> s
  | Error _ -> failwith "Failed to start link"

let add_item ~connection_manager_pid ~ref ~item =
  let _ = Holder.new_holder connection_manager_pid ref item in

  ()

let get_holder_item connection_manager_pid =
  send connection_manager_pid (Messages.LockHolder (self ()));

  receive ()

let release ~connection_manager_pid ~holder_pid =
  send connection_manager_pid (Messages.CheckIn holder_pid)
