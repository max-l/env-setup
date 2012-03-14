import com.typesafe.sbteclipse.plugin.EclipsePlugin._

EclipseKeys.configurations := Set(Configurations.Compile, Configurations.Test, Configurations.Runtime)

EclipseKeys.createSrc <<= ((sourceGenerators in Compile) { sourgeGens =>  
  if(sourgeGens == Nil)
    EclipseCreateSrc.ValueSet(EclipseCreateSrc.Unmanaged, EclipseCreateSrc.Source)
  else 
    EclipseCreateSrc.ValueSet(EclipseCreateSrc.Unmanaged, EclipseCreateSrc.Source, EclipseCreateSrc.Managed)
})

logLevel in Global := Level.Warn

publishArtifact in packageDoc := false

scalacOptions ++= Seq("-unchecked", "-deprecation")