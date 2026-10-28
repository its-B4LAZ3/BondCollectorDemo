
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DELX SCRIPTS</title>
<style>
* { box-sizing: border-box; }
body {
  margin: 0;
  padding: 14px;
  background: #071126;
  color: #edf4ff;
  font-family: Arial, sans-serif;
}
#app {
  max-width: 440px;
  margin: auto;
  background: #0b1730;
  border: 1px solid #2b4774;
  border-radius: 14px;
  overflow: hidden;
}
header {
  padding: 16px;
  background: linear-gradient(110deg,#173d7b,#10254a);
  border-bottom: 1px solid #36588a;
}
.brand {
  color: #a5caff;
  font-size: 10px;
  letter-spacing: 1.5px;
  font-weight: bold;
}
h1 { font-size: 22px; margin: 5px 0; }
.subtitle { font-size: 11px; color: #b9d0f0; }
main { padding: 13px; }
.topline {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 8px;
}
.pill {
  font-size: 9px;
  color: #8fbeff;
  border: 1px solid #36598a;
  padding: 5px;
  border-radius: 5px;
}
.section {
  font-size: 11px;
  font-weight: bold;
  letter-spacing: 1.2px;
  color: #8db9ff;
  margin: 19px 0 9px;
}
.item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 9px;
  background: #122342;
  border: 1px solid #293f63;
  border-radius: 9px;
  padding: 11px;
  margin-bottom: 7px;
}
.item strong { display: block; font-size: 13px; }
.item small {
  display: block;
  font-size: 10px;
  color: #9aafd0;
  margin-top: 4px;
}
button {
  cursor: pointer;
  font: inherit;
}
.action {
  font-size: 10px;
  font-weight: bold;
  color: white;
  background: #2856a0;
  border: 1px solid #477cc6;
  border-radius: 7px;
  padding: 9px 10px;
  white-space: nowrap;
}
.action:hover { background: #376fc0; }
.switch {
  width: 42px;
  height: 23px;
  border-radius: 20px;
  border: 1px solid #526785;
  background: #28364b;
  padding: 3px;
  flex-shrink: 0;
}
.switch span {
  display: block;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  background: #c3d0e3;
  transition: transform .15s;
}
.switch[aria-checked="true"] {
  background: #2563c7;
  border-color: #75aaff;
}
.switch[aria-checked="true"] span {
  transform: translateX(18px);
  background: white;
}
.dropdown {
  width: 100%;
  text-align: left;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #182f54;
  border: 1px solid #3a5b8b;
  border-radius: 8px;
  color: #e4efff;
  padding: 12px;
  font-size: 11px;
  font-weight: bold;
}
.list { display: none; margin-top: 9px; }
.list.open { display: block; }
.status {
  padding: 10px;
  background: #091326;
  border: 1px solid #273c5c;
  border-radius: 8px;
  font-size: 11px;
  color: #b7c9e4;
  line-height: 1.5;
  overflow-wrap: anywhere;
}
.note {
  font-size: 10px;
  color: #849cbd;
  line-height: 1.5;
}
.footer {
  text-align: center;
  margin-top: 13px;
  color: #849cbd;
  font-size: 10px;
}
.reset {
  background: #182a47;
  border: 1px solid #3a5278;
  color: #d5e4fa;
  border-radius: 7px;
  padding: 8px 12px;
  font-size: 11px;
}
</style>
</head>
<body>
<div id="app">
  <header>
    <div class="topline">
      <div>
        <div class="brand">ITS_B4LAZ3</div>
        <h1>DELX SCRIPTS</h1>
        <div class="subtitle">Main Panel · Interactive UI</div>
      </div>
      <div style="font-size:25px;background:#254b82;border:1px solid #4d76ae;border-radius:10px;padding:9px">⚙</div>
    </div>
  </header>

  <main>
    <div class="topline">
      <strong style="font-size:14px">MAIN PANEL</strong>
      <span class="pill">PREVIEW ONLY</span>
    </div>

    <div class="section">AUTOMATION</div>

    <div class="item">
      <div>
        <strong>Auto BOND</strong>
        <small>Bond collection</small>
      </div>
      <button class="switch" role="switch" aria-checked="false"
        aria-label="Auto BOND"><span></span></button>
    </div>

    <div class="item">
      <div>
        <strong>TP BOND HERE</strong>
        <small>Bring bonds to your character</small>
      </div>
      <button class="action" data-action="TP BOND HERE">ACTIVATE</button>
    </div>

    <div class="item">
      <div>
        <strong>Auto Win</strong>
        <small>Win-condition toggle</small>
      </div>
      <button class="switch" role="switch" aria-checked="false"
        aria-label="Auto Win"><span></span></button>
    </div>

    <div class="item">
      <div>
        <strong>Auto Milestone</strong>
        <small>Milestone-system toggle</small>
      </div>
      <button class="switch" role="switch" aria-checked="false"
        aria-label="Auto Milestone"><span></span></button>
    </div>

    <div class="section">BRING ANY ITEM</div>

    <button class="dropdown" data-toggle="items" aria-expanded="false">
      <span>OPEN ITEM LIST</span><span class="arrow">▾</span>
    </button>

    <div id="items" class="list">
      <div class="item">
        <div>
          <strong>Item list is empty</strong>
          <small>Your item names can be added here later.</small>
        </div>
      </div>
      <div class="note">Waiting for your item list.</div>
    </div>

    <div class="section">TELEPORT LOCATIONS</div>

    <button class="dropdown" data-toggle="villages" aria-expanded="false">
      <span>OPEN VILLAGE LIST</span><span class="arrow">▾</span>
    </button>

    <div id="villages" class="list">
      <div class="item">
        <div><strong>Village 2</strong><small>Village destination</small></div>
        <button class="action" data-action="Village 2">GO ↗</button>
      </div>
      <div class="item">
        <div><strong>Village 3</strong><small>Village destination</small></div>
        <button class="action" data-action="Village 3">GO ↗</button>
      </div>
      <div class="item">
        <div><strong>Village 4</strong><small>Village destination</small></div>
        <button class="action" data-action="Village 4">GO ↗</button>
      </div>
      <div class="item">
        <div><strong>Village 5</strong><small>Village destination</small></div>
        <button class="action" data-action="Village 5">GO ↗</button>
      </div>
      <div class="item">
        <div><strong>Village 6</strong><small>Village destination</small></div>
        <button class="action" data-action="Village 6">GO ↗</button>
      </div>
      <div class="item">
        <div><strong>Village 7</strong><small>Village destination</small></div>
        <button class="action" data-action="Village 7">GO ↗</button>
      </div>
      <div class="item">
        <div>
          <strong>Teleport to End</strong>
          <small>End destination</small>
        </div>
        <button class="action" data-action="Teleport to End">GO ↗</button>
      </div>
    </div>

    <div class="section">ACTIVITY LOG</div>
    <div id="status" class="status" aria-live="polite">
      Ready. Preview controls are not connected to a game.
    </div>

    <div style="display:flex;justify-content:flex-end;margin-top:10px">
      <button class="reset" id="reset">RESET UI</button>
    </div>

    <div class="footer">DELX SCRIPTS · UI PREVIEW ONLY</div>
  </main>
</div>

<script>
(() => {
  const app = document.getElementById("app");
  const status = document.getElementById("status");
  const defaultStatus =
    "Ready. Preview controls are not connected to a game.";

  app.querySelectorAll(".switch").forEach(button => {
    button.addEventListener("click", () => {
      const enabled =
        button.getAttribute("aria-checked") !== "true";

      button.setAttribute("aria-checked", String(enabled));

      status.textContent =
        button.getAttribute("aria-label") + ": " +
        (enabled ? "ON" : "OFF") +
        ". Visual state only; no game action executed.";
    });
  });

  app.querySelectorAll("[data-toggle]").forEach(button => {
    button.addEventListener("click", () => {
      const list = document.getElementById(
        button.dataset.toggle
      );
      const isOpen = list.classList.toggle("open");

      button.setAttribute("aria-expanded", String(isOpen));
      button.querySelector("span:first-child").textContent =
        isOpen
          ? "CLOSE " +
            (button.dataset.toggle === "villages"
              ? "VILLAGE LIST"
              : "ITEM LIST")
          : "OPEN " +
            (button.dataset.toggle === "villages"
              ? "VILLAGE LIST"
              : "ITEM LIST");

      button.querySelector(".arrow").textContent =
        isOpen ? "▴" : "▾";
    });
  });

  app.querySelectorAll("[data-action]").forEach(button => {
    button.addEventListener("click", () => {
      status.textContent =
        button.dataset.action +
        " selected. Preview only; no game action performed.";
    });
  });

  document.getElementById("reset").addEventListener("click", () => {
    app.querySelectorAll(".switch").forEach(button => {
      button.setAttribute("aria-checked", "false");
    });

    app.querySelectorAll(".list").forEach(list => {
      list.classList.remove("open");
    });

    app.querySelectorAll("[data-toggle]").forEach(button => {
      button.setAttribute("aria-expanded", "false");
      button.querySelector("span:first-child").textContent =
        button.dataset.toggle === "villages"
          ? "OPEN VILLAGE LIST"
          : "OPEN ITEM LIST";
      button.querySelector(".arrow").textContent = "▾";
    });

    status.textContent = defaultStatus;
  });
})();
</script>
</body>
</html>
