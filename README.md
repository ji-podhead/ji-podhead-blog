# My Website
- fresh blogs and stuff

## CI-CD Pipeline
```mermaid
graph TB
    subgraph "Git"

        D(Development)
        I(Integration)
        T(Testing)
        GH(GH-Pages)
        M(Main/Production)
    end

classDef JP fill:#fffff,stroke:#333,stroke-width:2px,font-size:30px,text-align:left;
classDef GH fill:#Fffff,stroke:#9999,stroke-width:2px,font-size:30px;

    subgraph "Jenkins_Pipeline"
	    
	    Integration[
	    <h4>Integration Stage</h4>
	     Automatic Prebuild Tests
	     Security Tests
	     Build
	    ]
		Testing[
				<div style="text-align: center;">
				<h4>Testing Stage</h4>
				<ul>
				<li>Advanced Automatic Testing
				- E2E
				- Performance
				- Advanced Security Scanning
				- Cross-Browser- und Cross-Device-Tests
				- Accessibility-Tests
				<li>awaiting manual security pass using parameters
				</ul>
				</div>
		    ] 
        Production[
        <h4>Production Stage</h4>
        Deploy to HostProvider 
        push to production branch
        ]
	
	end
	
	subgraph "SecurityTeam"
		SECURITY("Automatically Assign Security Staff")
	    MANUAL_SECURITY("Manuall Security Checks")
	    SECURITY -.-> MANUAL_SECURITY
    end
Jenkins_Pipeline -.-> Git
	M --> D
	D --> I
	I --> T
	T --"finish CD cycle"--> GH
	T --"finish CI cycle"--> M 

Integration -- "triggers Testing Stage"--> Testing
Testing --> Production

	I -. "triggers Integration Stage".-> Integration
    Integration -. "git push".-> T
    
    Testing --.---> SecurityTeam
   
    
    Production -.-> M
    Production -.-> GH 

    classDef default fill:#f9f,stroke:#333,stroke-width:2px;
    classDef branch fill:#bbf,stroke:#333,stroke-width:2px;
    classDef action fill:#0f0,stroke:#333,stroke-width:2px;
    classDef securityTeam fill:#00f,stroke:#333,stroke-width:2px;
    class P,I,T,GH,M,D branch
    class SECURITY,MANUAL_SECURITY action
	class Jenkins_Pipeline JP
	class Git GH

```
