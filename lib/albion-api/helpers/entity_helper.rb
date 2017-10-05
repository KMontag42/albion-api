module AlbionApi
  module Entity
    module Helper
      def self.create_equipment(equipment_raw)
        AlbionApi::Entity::Equipment.new(
          *(equipment_raw.keys.map { |key| create_item(equipment_raw[key]) })
        )
      end

      def self.create_item(item_raw)
        AlbionApi::Entity::Item.new(
          item_raw['ActiveSpells'],
          item_raw['Count'],
          item_raw['PassiveSpells'],
          item_raw['Quality'],
          item_raw['Type']
        ) unless item_raw.nil?
      end

      def self.create_inventory(inventory_raw)
        inventory_raw.map do |item|
          create_item(item) unless item.nil?
        end
      end

      def self.create_player(player_raw)
        AlbionApi::Entity::Player.new(
          player_raw['AllianceId'],
          player_raw['AllianceName'],
          player_raw['AllianceTag'],
          player_raw['Avatar'],
          player_raw['AvatarRing'],
          player_raw['AverageItemPower'],
          player_raw['DeathFame'],
          create_equipment(player_raw['Equipment']),
          player_raw['FameRatio'],
          player_raw['GuildId'],
          player_raw['GuildName'],
          player_raw['Id'],
          create_inventory(player_raw['Inventory']),
          player_raw['KillFame'],
          player_raw['Name']
        )
      end

      def self.create_kill_participant(participant_raw)
        AlbionApi::Entity::KillParticipant.new(
          participant_raw['AllianceId'],
          participant_raw['AllianceName'],
          participant_raw['AllianceTag'],
          participant_raw['Avatar'],
          participant_raw['AvatarRing'],
          participant_raw['AverageItemPower'],
          participant_raw['DamageDone'],
          participant_raw['DeathFame'],
          create_equipment(participant_raw['Equipment']),
          participant_raw['FameRatio'],
          participant_raw['GuildId'],
          participant_raw['GuildName'],
          participant_raw['Id'],
          create_inventory(participant_raw['Inventory']),
          participant_raw['KillFame'],
          participant_raw['Name'],
          participant_raw['SupportHealingDone']
        )
      end

      def self.create_group_members(members_raw)
        members_raw.map do |member|
          create_player(member)
        end
      end

      def self.create_participants(participants_raw)
        participants_raw.map do |participant|
          create_kill_participant(participant)
        end
      end

      def self.create_death(death_raw)
        AlbionApi::Entity::Death.new(
          death_raw['BattleId'],
          death_raw['EventId'],
          create_group_members(death_raw['GroupMembers']),
          death_raw['GvGMatch'],
          death_raw['Killer'],
          death_raw['Location'],
          create_participants(death_raw['Participants']),
          death_raw['TimeStamp'],
          death_raw['TotalVictimKillFame'],
          death_raw['Type'],
          death_raw['Version'],
          create_player(death_raw['Victim'])
        )
      end
    end
  end
end
