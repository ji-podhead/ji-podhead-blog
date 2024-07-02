# My Website
- fresh blogs and stuff

## CI-CD Pipeline
```mermaid
graph TB
    subgraph "Source_Control"

        D(Development)
        I(Integration)
        T(Testing)
        M(Main/Production)
    end

classDef JP fill:#fffff,stroke:#333,stroke-width:2px,font-size:30px,text-align:left,margin-right: 450px;
classDef GH fill:#Fffff,stroke:#9999,stroke-width:2px,font-size:30px,text-align:left,margin-right: 350px;

    subgraph "Jenkins_Pipeline"
		
	     Integration[
	    <h4>Integration Stage</h4>
	     Automatic Prebuild Tests
	     Security Tests
	     Build
	    ]
		Testing[
				<div style="text-align: center;margin-left: 15px">
				<h3>Testing Stage</h3>
				<ul style="text-align: left;list-style: square; line-height: 0.8;">
				<li><b>Advanced Automatic Testing</b></li>
				<ol style="">
					<li>E2E</li>
					<li>Performance</li>
					<li>Advanced Security Scanning</li>
					<li>Cross-Browser- und Cross-Device-Tests</li>
					<li>Accessibility-Tests</li>
				</ol>
				<li><b>notiy Security Team for manual audition</b></li>
				<li><b>awaiting manual security checks using parameters</b></li>
				</ul>
				</div>
		    ] 
        Production[
		<div style="text-align: center; ">
		<h3>Production Stage</h3>
		<div style="text-align:left; line-height: 0.5;">
		<b>finishing CI-CD cycle:</b>
		<ul style="text-align: left;list-style: square; margin-left: 15px; line-height: 0.8;">	
		<li>Deploy to HostProvider</li>
        	<li>push to production branch</li>
		</ul>
                </div>
		</div>
        	]
	end
	
	subgraph "SecurityTeam"
		SECURITY("Automatically Assign Security Staff")
	    	MANUAL_SECURITY("Manuall Security Checks")
	    	SECURITY -.-> MANUAL_SECURITY
    	end

	GH[
		<div style="text-align: center;">
		<h4>Deployment</h4>
		
		<b>website can be hosted via:</b>
		<ul style="text-align: left;list-style: square; margin-left: 15px; line-height: 0.8;">	
		<li>selfhosted via k8s,vm,etc</li>
		<li>cloudprovider</li>
		<li>webhoster like GH-Pages</li>
		</ul>
		</div>
  	]

	M --> D
	D --> I
	I --> T
	T --"finish CD cycle"--> GH
	T --"finish CI cycle"--> M 
	Integration -- "triggers Testing Stage"--> Testing
	Testing --> Production
	I -. "triggers Integration Stage".-> Integration
    	Integration -. "push".-> T
      	Testing <-."assign Staff / trigger Production Stage".-> SecurityTeam
   	
    
    Production -."push".-> M
    Production -."deploy".-> GH 

    classDef default fill:#f9f,stroke:#333,stroke-width:2px;
    classDef branch fill:#bbf,stroke:#333,stroke-width:2px;
    classDef action fill:#0f0,stroke:#333,stroke-width:2px;
    classDef securityTeam fill:#00f,stroke:#333,stroke-width:2px;
    class P,I,T,GH,M,D branch
    class SECURITY,MANUAL_SECURITY action
	class Jenkins_Pipeline JP
	class Source_Control GH

```
