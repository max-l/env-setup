
import com.typesafe.sbteclipse.plugin.EclipsePlugin._

EclipseKeys.configurations := Set(Configurations.Compile, Configurations.Test, Configurations.Runtime)

logLevel in Global := Level.Warn

publishArtifact in packageDoc := false