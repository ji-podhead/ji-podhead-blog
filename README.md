# My Website
- fresh blogs and stuff

## CI-CD Pipeline
```mermaid
graph TB
    subgraph "Source_Control"

        D[
               <div style="text-align: center;margin-left: 15px; line-height: 0.5;">
		<h3>Development</h3>
</div>
 ]
        I[
               <div style="text-align: center;margin-left: 15px; line-height: 0.5;">
		<h3>Integration</h3>
</div>
]
        T[
               <div style="text-align: center;margin-left: 15px; line-height: 0.5;">
		<h3>Testing</h3>
</div>

]
        M[
               <div style="text-align: center;margin-left: 15px; line-height: 0.5;">
		<h3>Main / Production</h3>
</div>
]
    end

classDef JP fill:#B1BEDC,stroke:#C7A1FF,stroke-width:2px,font-size:30px,text-align:left,margin-right: 450px,font-color:#C7A1FF;
classDef GH fill:#AB95CD,stroke:#9999,stroke-width:2px,font-size:30px,text-align:left,margin-right: 350px;

    subgraph "CI-CD_Pipeline"
		
	Integration[
		<div style="text-align: center;margin-left: 15px; line-height: 0.5;">
		<h3>Integration Stage</h3>
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
				<h3>Testing Stage</h3>
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
		<h3>Manual Approval</h3>
		<ul style="text-align: left;list-style: square; margin-left: 15px; line-height: 0.5;">	
		<ol>
		<li>final spellchecks</li>
		<li>final render in testproduction environment/branch</li>
		<li>a dynamic App requires pentesting and auditing</li>
		</ol>
<li><b>merged pullRequest triggers Production Stage</b></li>
</ul>
</div>
			
] 
        Production[
               <div style="text-align: center;margin-left: 15px; line-height: 0.5;">
		<h3>Production Stage</h3>
		<ul style="text-align: left;list-style: square; margin-left: 15px; line-height: 0.5;">	
		<li>deploy build-folder</li>
		<li>remove build-folder</li>
		<li>push workspace to production branch</li>
		</ul>
          
		</div>
		]
	GH[
               <div style="text-align: center;margin-left: 15px; line-height: 0.5;">
		<h3>Deployment</h3>
		<ul style="text-align: left;list-style: square; margin-left: 15px; line-height: 0.5;">	
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
		<h3>Continuous Monitoring</h3>
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
