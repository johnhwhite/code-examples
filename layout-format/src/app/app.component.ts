import { Component, Renderer2 } from '@angular/core';
import {
  SkyTheme,
  SkyThemeMode,
  SkyThemeService,
  SkyThemeSettings,
} from '@skyux/theme';

@Component({
  selector: 'sky-demo-app',
  template: '<app-format-demo></app-format-demo>',
})
export class AppComponent {
  constructor(themeSvc: SkyThemeService, renderer: Renderer2) {
    const themeSettings = new SkyThemeSettings(
      SkyTheme.presets.default,
      SkyThemeMode.presets.light
    );
    themeSvc.init(document.body, renderer, themeSettings);
  }
}
