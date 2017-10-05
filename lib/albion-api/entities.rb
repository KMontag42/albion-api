module AlbionApi
  # this module describes all of the relevant data shapes for Entities in the Albion API
  module Entity
    PLAYER_FIELDS = [
      :alliance_id,
      :alliance_name,
      :alliance_tag,
      :avatar,
      :avatar_ring,
      :average_item_power,
      :death_fame,
      :equipment,
      :fame_ratio,
      :guild_id,
      :guild_name,
      :id,
      :inventory,
      :kill_fame,
      :name
    ]

    Player = Struct.new(*PLAYER_FIELDS)
    Equipment = Struct.new(
      :armor,
      :bag,
      :cape,
      :food,
      :head,
      :main_hand,
      :mount,
      :off_hand,
      :potion,
      :shoes
    )
    Item = Struct.new(
      :active_spells,
      :count,
      :passive_spells,
      :quality,
      :type
    )
    Death = Struct.new(
      :battle_id,
      :event_id,
      :group_members,
      :gvg_match,
      :killer,
      :location,
      :participants,
      :timestamp,
      :total_victim_kill_fame,
      :type,
      :version,
      :victim
    ) do
      def group_member_count
        group_members.length
      end

      def number_of_participants
        participants.length
      end
    end

    KillParticipant = Struct.new(
      *(PLAYER_FIELDS.concat([:damage_done, :support_healing_done]))
    )

    WeaponCategory = Struct.new(:id, :name)
  end
end
