"""
Tests for the voice client module.
"""

import pytest

from voice_generator.voice_client import VoiceClient
from voice_generator.constants import DEFAULT_VOICE_MODEL, ALLOWED_LANGUAGE_MODELS


class TestVoiceClientModelValidation:
    """Test cases for model resolution and validation in VoiceClient."""

    def test_default_model_when_nothing_configured(self, monkeypatch):
        """Test that the default model is used when neither parameter nor environment is set."""
        monkeypatch.delenv('ELEVENLABS_MODEL', raising=False)

        client = VoiceClient(api_key="test-key")

        assert client.model == DEFAULT_VOICE_MODEL

    def test_valid_model_parameter_is_used(self, monkeypatch):
        """Test that a valid model parameter is accepted."""
        monkeypatch.delenv('ELEVENLABS_MODEL', raising=False)

        client = VoiceClient(api_key="test-key", model=ALLOWED_LANGUAGE_MODELS[0])

        assert client.model == ALLOWED_LANGUAGE_MODELS[0]

    def test_valid_env_model_is_used(self, monkeypatch):
        """Test that a valid ELEVENLABS_MODEL environment value is accepted."""
        monkeypatch.setenv('ELEVENLABS_MODEL', ALLOWED_LANGUAGE_MODELS[1])

        client = VoiceClient(api_key="test-key")

        assert client.model == ALLOWED_LANGUAGE_MODELS[1]

    def test_model_parameter_overrides_env(self, monkeypatch):
        """Test that the model parameter takes precedence over the environment."""
        monkeypatch.setenv('ELEVENLABS_MODEL', ALLOWED_LANGUAGE_MODELS[1])

        client = VoiceClient(api_key="test-key", model=ALLOWED_LANGUAGE_MODELS[0])

        assert client.model == ALLOWED_LANGUAGE_MODELS[0]

    def test_invalid_model_parameter_raises(self, monkeypatch):
        """Test that an invalid model parameter raises a ValueError."""
        monkeypatch.delenv('ELEVENLABS_MODEL', raising=False)

        with pytest.raises(ValueError, match="not allowed"):
            VoiceClient(api_key="test-key", model="invalid_model")

    def test_invalid_env_model_raises_with_hint(self, monkeypatch):
        """Test that an invalid ELEVENLABS_MODEL environment value raises a ValueError naming the variable."""
        monkeypatch.setenv('ELEVENLABS_MODEL', 'invalid_model')

        with pytest.raises(ValueError, match="ELEVENLABS_MODEL"):
            VoiceClient(api_key="test-key")
