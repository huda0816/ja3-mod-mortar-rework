UndefineClass('MortarInventoryItem')
DefineClass.MortarInventoryItem = {
	__parents = { "Mortar" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	__copy_group = "Firearm - Heavy",
	object_class = "Mortar",
	Reliability = 70,
	ScrapParts = 16,
	Caliber = "MortarShell",
	Entity = "Weapon_M224",
	Icon = "UI/Icons/Weapons/M224",
	DisplayName = T(111273562524, --[[ModItemInventoryItemCompositeDef MortarInventoryItem DisplayName]] "M224 Mortar"),
	DisplayNamePlural = T(487139682291, --[[ModItemInventoryItemCompositeDef MortarInventoryItem DisplayNamePlural]] "M224 Mortars"),
	Description = T(829888420671, --[[ModItemInventoryItemCompositeDef MortarInventoryItem Description]] "Lightweight system that allows for 60mm close support rain of fire or other ordnance. "),
	AdditionalHint = T(283853790769, --[[ModItemInventoryItemCompositeDef MortarInventoryItem AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Bombards a remote area after a delay\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Cumbersome (no Free Move)"),
	LargeItem = true,
	Cumbersome = true,
	UnitStat = "Explosives",
	is_valuable = true,
	Cost = 10000,
	CritChanceScaled = 0,
	MagazineSize = 6,
	PenetrationClass = 4,
	WeaponRange = 70,
	Noise = 50,
	HandSlot = "TwoHanded",
	HolsterSlot = "Shoulder",
	PreparedAttackType = "None",
	ShootAP = 6000,
}

