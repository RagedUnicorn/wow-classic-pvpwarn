# Voice Pack Loading Flow

This diagram illustrates how PVPWarn handles voice pack registration and activation, showing how multiple voice packs can register while only one can be active at any time.

```mermaid
flowchart TD
    Start([WoW Client Starts]) --> LoadPVPWarn[PVPWarn Addon Loads]
    LoadPVPWarn --> InitDefault[Initialize Default Voice Pack<br/>RegisterDefaultVoicePack]
    InitDefault --> DefaultActive[Default Voice Pack Active<br/>Uses built-in sounds]

    LoadPVPWarn --> CheckConfig{Check Configuration:<br/>What voice pack is saved?}
    CheckConfig -->|Saved: 'default'| DefaultActive
    CheckConfig -->|Saved: 'custom_pack_name'| WaitForPack[Waiting for configured pack<br/>Using default in meantime]

    %% Multiple voice packs can load
    LoadPVPWarn -.-> VP1[VoicePack1 Addon Loads]
    LoadPVPWarn -.-> VP2[VoicePack2 Addon Loads]
    LoadPVPWarn -.-> VP3[VoicePack3 Addon Loads]
    LoadPVPWarn -.-> VPN[VoicePackN Addon Loads]

    %% Each pack registers itself
    VP1 --> Reg1[RegisterVoicePack<br/>'pack1']
    VP2 --> Reg2[RegisterVoicePack<br/>'pack2']
    VP3 --> Reg3[RegisterVoicePack<br/>'pack3']
    VPN --> RegN[RegisterVoicePack<br/>'packN']

    %% Check if registered pack matches config
    Reg1 --> Check1{Is 'pack1' the<br/>configured pack?}
    Reg2 --> Check2{Is 'pack2' the<br/>configured pack?}
    Reg3 --> Check3{Is 'pack3' the<br/>configured pack?}
    RegN --> CheckN{Is 'packN' the<br/>configured pack?}

    %% Only configured pack becomes active
    Check1 -->|Yes| Pack1Active[Pack1 Becomes Active<br/>GetActiveVoicePackPath returns pack1 path]
    Check1 -->|No| Pack1Registered[Pack1 Registered Only<br/>Available in dropdown]

    Check2 -->|Yes| Pack2Active[Pack2 Becomes Active<br/>GetActiveVoicePackPath returns pack2 path]
    Check2 -->|No| Pack2Registered[Pack2 Registered Only<br/>Available in dropdown]

    Check3 -->|Yes| Pack3Active[Pack3 Becomes Active<br/>GetActiveVoicePackPath returns pack3 path]
    Check3 -->|No| Pack3Registered[Pack3 Registered Only<br/>Available in dropdown]

    CheckN -->|Yes| PackNActive[PackN Becomes Active<br/>GetActiveVoicePackPath returns packN path]
    CheckN -->|No| PackNRegistered[PackN Registered Only<br/>Available in dropdown]

    %% User can change selection
    UserSelect[User Selects Different Pack<br/>in Settings Menu] --> UpdateConfig[SetActiveVoicePack<br/>Updates configuration]
    UpdateConfig --> NewActive[Selected Pack Becomes Active<br/>if it's registered]

    Pack1Registered -.-> UserSelect
    Pack2Registered -.-> UserSelect
    Pack3Registered -.-> UserSelect
    PackNRegistered -.-> UserSelect
    DefaultActive -.-> UserSelect

    %% Show that only one can be active
    Pack1Active -.-> OnlyOne{Only ONE pack<br/>active at a time}
    Pack2Active -.-> OnlyOne
    Pack3Active -.-> OnlyOne
    PackNActive -.-> OnlyOne
    DefaultActive -.-> OnlyOne

    style Start fill:#4a90e2,stroke:#333,stroke-width:2px,color:#fff
    style LoadPVPWarn fill:#4a90e2,stroke:#333,stroke-width:2px,color:#fff
    style InitDefault fill:#5cb85c,stroke:#333,stroke-width:2px,color:#fff
    style DefaultActive fill:#d9534f,stroke:#333,stroke-width:2px,color:#fff
    style Reg1 fill:#5cb85c,stroke:#333,stroke-width:2px,color:#fff
    style Reg2 fill:#5cb85c,stroke:#333,stroke-width:2px,color:#fff
    style Reg3 fill:#5cb85c,stroke:#333,stroke-width:2px,color:#fff
    style RegN fill:#5cb85c,stroke:#333,stroke-width:2px,color:#fff
    style Pack1Active fill:#d9534f,stroke:#333,stroke-width:2px,color:#fff
    style Pack2Active fill:#d9534f,stroke:#333,stroke-width:2px,color:#fff
    style Pack3Active fill:#d9534f,stroke:#333,stroke-width:2px,color:#fff
    style PackNActive fill:#d9534f,stroke:#333,stroke-width:2px,color:#fff
    style UserSelect fill:#f0ad4e,stroke:#333,stroke-width:2px,color:#000
    style UpdateConfig fill:#f0ad4e,stroke:#333,stroke-width:2px,color:#000
    style WaitForPack fill:#f0ad4e,stroke:#333,stroke-width:2px,color:#000
```

## Key Components

### Initial Load Sequence

1. **PVPWarn Loads**: When WoW starts, PVPWarn addon initializes
2. **Default Registration**: `RegisterDefaultVoicePack()` is called in `Core.lua`
3. **Default Activation**: Default voice pack is immediately active and available for use
4. **Configuration Check**: System checks saved configuration for previously selected voice pack

### Voice Pack Registration

Each voice pack addon must call `RegisterVoicePack()` when it loads:

```lua
mod.voicePack.RegisterVoicePack(name, displayName, assetPath)
```

- **name**: Internal identifier (e.g., "julie_us")
- **displayName**: User-friendly name shown in dropdown
- **assetPath**: Path to voice pack's sound files

### Registration vs Activation

- **Registered**: Voice pack is available in the dropdown menu
- **Active**: Voice pack is currently being used for sound playback
- Multiple packs can be registered simultaneously
- Only one pack can be active at any time

### Configuration Check on Registration

When a voice pack registers:
1. Pack is added to `registeredVoicePacks` table
2. System checks if this pack matches the saved configuration
3. If it matches, it automatically becomes available for use
4. If not, it's only added to the dropdown options

### User Selection Flow

1. User opens Voice Pack settings menu
2. Dropdown shows all registered voice packs
3. User selects a different pack
4. `SetActiveVoicePack()` updates configuration
5. `GetActiveVoicePackPath()` will now return the new pack's path

### Sound Loading Logic

In `Sound.lua`, the `GetBasePath()` function:
1. Calls `GetActiveVoicePackPath()`
2. If a custom pack is active and registered, returns its path
3. If not (or if "default" is selected), returns built-in sound path

### Fallback Behavior

- If configured pack isn't available: System uses default
- If voice pack fails to register: System continues with current pack
- If invalid pack is selected: System falls back to default
