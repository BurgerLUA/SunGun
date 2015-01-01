ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "HE GRENADE"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false 

AddCSLuaFile()

function ENT:Initialize()
	if SERVER then
		self:SetModel("models/weapons/w_eq_fraggrenade.mdl") 
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			phys:SetBuoyancyRatio(0)
		end
		
		self.Delay = CurTime() + 3
		self.First = true
	end
end

function ENT:PhysicsCollide(data, physobj)
	if SERVER then
		util.BlastDamage(self, self.Owner, data.HitPos, 10, 3)
	
		self:Remove()
		
	end
end



local mat = Material("rude/hello")

function ENT:Draw()
	if CLIENT then
		--self:DrawModel()
		
		render.SetMaterial( mat )
		render.DrawSprite( self:GetPos(), 16, 16, Color(255,255,255,255) )
		
	end
end


