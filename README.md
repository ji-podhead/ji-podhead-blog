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

classDef JP fill:#B1BEDC,stroke:#C7A1FF,stroke-width:2px,font-size:30px,text-align:left,margin-right: 450px,font-color:#C7A1FF;
classDef GH fill:#AB95CD,stroke:#9999,stroke-width:2px,font-size:30px,text-align:left,margin-right: 350px;

    subgraph "CI-CD_Pipeline"
		
	Integration[
		<div style="text-align: center;margin-left: 15px; line-height: 0.5;">
		<h4>Integration Stage</h4>
		<ul style="text-align: left;list-style: square; line-height: 0.5;">
		<li><b>Automatic Prebuild Testing</b></li>
		<ul>	
    		<li>SAST & DAST</li>
             	<li>OWASP Dependency-Check</li>
	    	</ul>
<li><b>Build</b></li>
		</ul>
		</div>
	]
	Testing[
				<div style="text-align: center;margin-left: 15px; line-height: 0.5;">
				<h4>Testing Stage</h4>
				<ul style="text-align: left;list-style: square; line-height: 0.5;">
				<li><b>Advanced Automatic Testing</b></li>
				<ol style="">
					<li>E2E</li>
					<li>Performance</li>
					<li>Advanced Security Scanning</li>
					<li>Cross-Browser- und Cross-Device-Tests</li>
					<li>Accessibility-Tests</li>
				</ol>
				<li><b>send pull Request & assign staff for manual aproval</b></li>
				</ul>
				</div>
	]
	Manual_Approval[
				<div style="text-align: center;margin-left: 15px; line-height: 0.5;">
		<h4>Manual Approval</h4>
				<ul style="text-align: left;list-style: square; line-height: 0.5;">
		<ol>
		<li>final spellchecks</li>
		<li>final render in testproduction environment/branch</li>
		<li>a dynamic App requires pentesting and auditing</li>
		</ol>
<li><b>merge pullRequest & trigger Production Stage</b></li>
</ul>
</div>
			
] 
        Production[
				<div style="text-align: center;margin-left: 15px; line-height: 0.5;">
		<h4>Production Stage</h4>
		
		<ul style="text-align: left;list-style: square; margin-left: 15px; line-height: 0.5;">	
		<li>Deploy to HostProvider</li>
        	<li>push to production branch</li>
		</ul>
          
		</div>
		]
	GH[
               <div style="text-align: center;margin-left: 15px; line-height: 0.5;">
		<h4>Deployment</h4>
		<ul style="text-align: left;list-style: square; margin-left: 15px; line-height: 0.8;">	
		<li><b>gets deployed using build folder of testing/build branch</b></li>
		<li><b>website can be hosted via:</b></li>
		<ul>
<li>selfhosted via k8s,vm,etc</li>
		<li>cloudprovider</li>
		<li>webhoster like GH-Pages</li>
		</ul>
</ul>
		</div>
  	]
	Monitoring[
				<div style="text-align: center;margin-left: 15px; line-height: 0.5;">
		<h4>Continuous Monitoring</h4>
		<ul style="text-align: left;list-style: square; margin-left: 15px; line-height: 0.5;">	
		<li><b>Monitoring depends on deployment!</b></li>
		<li>we choose GH-Pages hoster, so no further monitoring</li>
		<li><b>dynmaic-App Monitoring:</b></li>
		<ul>
		<li>threats</li>
		<li>traffic</li>
		<li>logs with kafka.</li>
		</ul>
		</div>
		]

	end
	


	

	M --> D
	D --> I
	I --> T

	T --"finish CD cycle"--> M 
	Integration --> Testing
	
	I -. "merge triggers Integration Stage".-> Integration
    	Integration -. "push->testing".-> T
      	Testing --> Manual_Approval
   	Manual_Approval --> Production 
       	Manual_Approval -."pull request (testing->main)".-> M
	M -."merge(testing->main) triggers Production Stage".-> Production
    	Production --> GH
	GH -->Monitoring
	Monitoring -->Integration
    classDef default fill:#ADD9FF,stroke:#333,stroke-width:2px;
    classDef branch fill:#bbf,stroke:#333,stroke-width:2px;
    classDef action fill:#ADD9FF stroke:#333,stroke-width:2px;
    classDef Manual_Approval fill:#00f,stroke:#333,stroke-width:2px;
    class P,I,T,GH,M,D branch
class CI-CD_Pipeline JP
class Source_Control GH

```
