defmodule Omnipresence.MapTest do
  use ExUnit.Case, async: true

  describe "present?/1" do
    test "empty map" do
      refute Omnipresence.present?(%{})
    end

    test "populated map" do
      assert Omnipresence.present?(%{foo: :bar})
    end
  end

  describe "blank?/1" do
    test "empty map" do
      assert Omnipresence.blank?(%{})
    end

    test "populated map" do
      refute Omnipresence.blank?(%{foo: :bar})
    end
  end

  describe "presence/1" do
    test "empty map" do
      assert Omnipresence.presence(%{}) == nil
    end

    test "populated map" do
      assert Omnipresence.presence(%{foo: :bar}) == %{foo: :bar}
    end
  end
end
