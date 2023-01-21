var/const/WASTELAND			=(1<<3)

var/const/CAPTAIN			=(1<<0)
var/const/NCR_SERGEANT		=(1<<1)
var/const/NCR_RANGER		=(1<<2)
var/const/RANGER			=(1<<3)
var/const/TROOPER			=(1<<4)
//var/const/CCO				=(1<<4)

var/const/RECRUIT			=(1<<5)
var/const/PRIME				=(1<<6)
var/const/LEGDECAN			=(1<<7)
var/const/LEGVEX			=(1<<8)
var/const/LEGCENTURION		=(1<<9)
var/const/LEGLEGAT			=(1<<10)
var/const/CAMPFOLLOWER		=(1<<11)

var/const/SHERIFF			=(1<<12)
var/const/SETTLER			=(1<<13)
var/const/ADVENTURER		=(1<<14)
var/const/RAIDER        	=(1<<15)
var/const/MAYOR				=(1<<16)

//This jobs using medsci flag, cause me too lazy.

var/const/COLONEL				=(1<<1)
var/const/ENCLAVE_LIEUTENANT	=(1<<2)
var/const/ENCLAVE_SCIENTIST		=(1<<3)
var/const/ENCLAVE_PRIVATE		=(1<<4)
var/const/ENCLAVE_RECRUIT		=(1<<5)

var/const/MERCENARY			=(1<<6)
var/const/GANGLEAD			=(1<<7)
var/const/GHOUL_MASTER		=(1<<8)
var/const/GHOUL_HAND		=(1<<9)
var/const/GHOUL_PRIEST		=(1<<10)


//engsec

var/const/ELDER				=(1<<1)
var/const/HEADPALADIN		=(1<<2)
var/const/PALADIN			=(1<<3)
var/const/HEADSCRIBE		=(1<<4)
var/const/KNIGHT			=(1<<5)
var/const/SCRIBE            =(1<<6)

var/const/CITIZEN			=(1<<7)

var/const/OVERSEER			=(1<<8)
var/const/VAULTENGINEER		=(1<<9)
var/const/VAULTOFFICER		=(1<<10)
var/const/VAULTDOCTOR		=(1<<11)
var/const/VAULTDWELLER		=(1<<12)




var/list/vault_occupations = list(
	"Vault Dweller",
	"Vault Medical Doctor",
	"Vault Security Officer",
	"Vault Engineer",
	"Vault Overseer"
)

var/list/brotherhood_occupations = list(
	"Brotherhood Elder",
	"Brotherhood Head Paladin",
	"Brotherhood Head Scribe",
	"Brotherhood Paladin",
	"Brotherhood Knight",
	"Brotherhood Scribe"
)

var/list/enclave_occupations = list(
	"Enclave Colonel",
	"Enclave Lieutenant",
	"Enclave Private",
	"Enclave Scientist",
	"Enclave Recruit"
)

var/list/legion_occupations = list(
	"Legion Legatus",
	"Legion Centurion",
	"Legion Vexillarius",
	"Legion Decanus",
	"Legion Prime",
	"Legion Recruit",
	"Legion Camp Follower"
)

var/list/ncr_occupations = list(
	"NCR Captain",
	"NCR Sergeant",
	"NCR Patrol Ranger",
	"NCR Veteran Ranger",
	"NCR Trooper"
)

var/list/city_occupations = list(
	"New Alamo Mayor",
	"New Alamo Sheriff",
	"New Alamo Citizen"
)

var/list/freelance_occupations = list(
	"Wasteland Adventurer",
	"Wasteland Settler"
)

var/list/raider_occupations = list(
	"Raider Gang Leader",
	"Raider Gang Member"
)
