UndefineClass('MortarShell_HE')
DefineClass.MortarShell_HE = {
	__parents = { "Ordnance" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ordnance",
	RepairCost = 0,
	Repairable = false,
	Reliability = 100,
	Icon = "UI/Icons/Items/mortar_shell_he",
	DisplayName = T(807825550899, --[[ModItemInventoryItemCompositeDef MortarShell_HE DisplayName]] "Mortar Cartridge"),
	DisplayNamePlural = T(819652322047, --[[ModItemInventoryItemCompositeDef MortarShell_HE DisplayNamePlural]] "Mortar Cartridges"),
	Description = T(783466487649, --[[ModItemInventoryItemCompositeDef MortarShell_HE Description]] "Explosive Ordnance ammo for Mortars."),
	CenterUnitDamageMod = 200,
	CenterObjDamageMod = 500,
	CenterAppliedEffects = {
		"Suppressed",
	},
	AreaOfEffect = 4,
	CenterAreaOfEffect = 2,
	AreaAppliedEffects = {
		"Suppressed",
	},
	PenetrationClass = 4,
	BurnGround = false,
	Caliber = "MortarShell",
	BaseDamage = 30,
}

