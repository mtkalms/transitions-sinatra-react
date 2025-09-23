/*!
 * Color mode toggler for Bootstrap's docs (https://getbootstrap.com/)
 * Copyright 2011-2025 The Bootstrap Authors
 * Licensed under the Creative Commons Attribution 3.0 Unported License.
 *
 * CHANGED: Exchanged the theme dropdown menu for a theme toggle button.
 */

(() => {
    'use strict'

    const getStoredTheme = () => localStorage.getItem('theme')
    const setStoredTheme = theme => localStorage.setItem('theme', theme)

    const getPreferredTheme = () => {
        const storedTheme = getStoredTheme()
        if (storedTheme) {
            return storedTheme
        }

        return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
    }

    const setTheme = theme => {
        if (theme === 'auto') {
            document.documentElement.setAttribute('data-bs-theme', (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'))
        } else {
            document.documentElement.setAttribute('data-bs-theme', theme)
        }
    }

    setTheme(getPreferredTheme())

    const showActiveTheme = (theme, focus = false) => {
        const themeToggler = document.querySelector('#theme-toggle')
        const themeIcons = {
            auto: 'circle-half',
            light: 'sun',
            dark: 'moon-stars'
        }
        const themeIcon = themeToggler.querySelector('i')

        if (!themeToggler) {
            return
        }
        themeIcon.setAttribute('class', `bi bi-${themeIcons[theme]}`)

        if (focus) {
            themeToggler.focus()
        }
    }

    const toggleTheme = () => {
        const themes = ['auto', 'light', 'dark']
        const theme = themes[(themes.indexOf(getStoredTheme()) + 1) % themes.length]
        setStoredTheme(theme)
        setTheme(theme)
        showActiveTheme(theme, true)
    }

    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
        const storedTheme = getStoredTheme()
        if (storedTheme !== 'light' && storedTheme !== 'dark') {
            setTheme(getPreferredTheme())
        }
    })

    window.addEventListener('DOMContentLoaded', () => {
        showActiveTheme(getPreferredTheme())
        document.getElementById('theme-toggle').addEventListener('click', toggleTheme)
    })
})()