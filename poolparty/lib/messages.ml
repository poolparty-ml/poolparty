open Riot

type Message.t +=
  | CheckIn of Pid.t
  | CheckOut of Pid.t
  | LockHolder of Pid.t
  | NewHolder : 'value Ref.t -> Message.t
  | HolderMessage : Pid.t * 'value Ref.t * 'value -> Message.t
