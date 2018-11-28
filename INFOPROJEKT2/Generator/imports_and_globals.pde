import peasy.*;
import java.io.PrintStream;
import java.io.FileOutputStream;
import java.util.*;
import java.util.concurrent.*;
PeasyCam cam;

/// PLAYERVARIABLES
int volume = 1000;        // size of the outputlandscape
int detail = 80;         // blocks per edge
float v1=2; // Oberflächennoiseveränderungsgeschwindigkeit (0.7 ist normal)
float v2=0.1; // Grastiefe (0.1 ist normal)
float v3=40; // Wasserspiegelhöhe in Prozent (40 ist normal)
float v4=0; // Grassfarbe fällt ab v4% über der Wasseroberfläche an
float v5=0.5; // gibt Z-addition der noise an (0=normalprerlin 1>v5>0 Überhänge v5>>0 Layers)
boolean rotate=false; // Gibt an, ob sich die Karte dreht
boolean walk=true; // Gibt an ob sich die Karte indirekt bewegt
float xWalk = 1; // gibt an in welche Richtung sich die Karte indirekt bewegt
float yWalk = 0; // -//-
int dne = 5; // depthnoiseearth: das Inverse ist die Volatilität der Erdtiefe
int dng = 1; // depthnoisegrass: -//- mit Gras
///

int counter=0;
int count=0;

float rc = PI/4;             // camerarotation
int size = volume/detail; // size of the blocks

int box[][][] = new int[detail][detail][detail]; // 3D Worldarray
boolean see[][][] = new boolean[detail][detail][detail]; // 3D Worldarray seestatus (1 = seeable, 0 = not)