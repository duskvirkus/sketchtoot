
String sketchtootPath = "../sketchtoot/";
JSONObject sketchtootConfig;
int sketchtootExportCount = 0;

void sketchtootSettings() {
  sketchtootConfig = loadJSONObject(sketchtootPath + "config.json");
  sketchtootConfig.setInt("runNumber", sketchtootConfig.getInt("runNumber") + 1);
  saveJSONObject(sketchtootConfig, sketchtootPath + "config.json");
}

void sketchtootCheckExport() {
  if (keyCode == 112) { // F1 key 
    sketchtootExport();
  }
}

void sketchtootExport() {
  save(sketchtootPath + sketchtootConfig.getString("sketchName") + "-" + sketchtootConfig.getInt("runNumber") + "-" + sketchtootExportCount + ".png");
  
  sketchtootExportCount++;
}
