Huge House Rails Project

Client
username
firstname
lastname
email
password
has_many reservations
has_many events, through reservations

Event
title
description
has_many reservations
has_many users, through reservations
has_many vendors

Reservation
starttime
endtime
belongs_to user
belongs_to event

Vendor
name
type
description
belongs_to event