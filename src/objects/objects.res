/* Combine types */
type normalCar = {"name": string, "manufacturer": string}
// The ...spread only support object type, not record
type electricCar = {...normalCar, "range": int, "chargingSpeed": int}